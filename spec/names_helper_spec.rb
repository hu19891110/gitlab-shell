require 'spec_helper'
require 'names_helper'

describe NamesHelper do
  include NamesHelper

  describe :extract_repo_name do
    it { extract_repo_name(' /opt/repos/randx/gitlab.git').should == 'randx/gitlab' }
    it { extract_repo_name("/opt/repos/randx/gitlab.git\r\n").should == 'randx/gitlab' }
  end

  describe :extract_ref_name do
    it { extract_ref_name('refs/heads/awesome-feature').should == 'awesome-feature' }
    it { extract_ref_name('refs/tags/v2.2.1').should == 'v2.2.1' }
    it { extract_ref_name('refs/tags/releases/v2.2.1').should == 'releases/v2.2.1' }
  end
end
